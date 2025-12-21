export function formatDuration(ms) {
    if (!ms || ms <= 0) return '';

    const totalSeconds = Math.floor(ms / 1000);
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = totalSeconds % 60;

    if (minutes < 60) {
        return `${minutes}:${seconds.toString().padStart(2, '0')}`;
    }

    const hours = Math.floor(minutes / 60);
    const mins = minutes % 60;

    return `${hours}:${mins.toString().padStart(2, '0')}`;
}
